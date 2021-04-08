import 'package:flutter/material.dart';

double paddingTop;

class BodyLayout extends StatelessWidget {
  static double safeH;
  static bool keyboardVisible = false;
  final Widget bodyWidget;

  BodyLayout(this.bodyWidget) : super();

  @override
  Widget build(BuildContext context) {
    final double fullH = MediaQuery.of(context).size.height;
    final double keyboardH =
        WidgetsBinding.instance.window.viewInsets.bottom ?? 0;

    keyboardVisible = keyboardH != 0;

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (!keyboardVisible) {
        safeH = constraints.maxHeight;
      }

      paddingTop = fullH - safeH;

      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: bodyWidget,
      );
    }));
  }
}
