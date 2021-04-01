import 'package:flutter/material.dart';
import '../../theme/official_theme.dart';

import 'components/Body.dart';

class HistoryPage extends StatelessWidget {
  static String routeName = "/history";
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
        body: Body(title, paddingTop),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FloatingActionButton.extended(
            onPressed: () => {},
            label: Text('Sent Message'),
            backgroundColor: primaryColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
