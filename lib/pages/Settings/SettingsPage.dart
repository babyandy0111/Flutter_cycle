import 'package:flutter/material.dart';

import 'components/Body.dart';

class SettingsPage extends StatelessWidget {
  static String routeName = "/settings";
  double safeH;
  bool keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final double fullH = MediaQuery.of(context).size.height;
    final double keyboardH = WidgetsBinding.instance.window.viewInsets.bottom;
    keyboardVisible = keyboardH != 0;

    return LayoutBuilder(builder: (context, constraints) {
      if (!keyboardVisible) {
        safeH = constraints.maxHeight;
      }

      final String title = 'Settings';
      final double paddingTop = fullH - safeH;
      return Scaffold(
        body: Body(title, paddingTop),
      );
    });
  }
}
