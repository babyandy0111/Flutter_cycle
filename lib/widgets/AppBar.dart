import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final double paddingTop;
  final Color radiusBarBgColor;
  final bool showLeftButtonWidgets;
  final bool showRightButtonWidgets;
  final Widget leftButtonWidgets;
  final Widget rightButtonWidgets;

  HeaderBar(
    this.title,
    this.paddingTop, {
    this.radiusBarBgColor = Colors.white,
    this.showLeftButtonWidgets = false,
    this.showRightButtonWidgets = false,
    this.rightButtonWidgets,
    this.leftButtonWidgets,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: paddingTop),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0.0, 0.15),
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(255, 90, 90, 1),
              Color.fromRGBO(255, 144, 114, 1),
            ]),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                showLeftButtonWidgets ? leftButtonWidgets : SizedBox(),
                Center(
                  child: Text(
                    title,
                    style: appBarTitle(),
                  ),
                ),
                showRightButtonWidgets ? rightButtonWidgets : SizedBox(),
              ],
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: radiusBarBgColor,
            ),
          ),
        ],
      ),
    );
  }
}
