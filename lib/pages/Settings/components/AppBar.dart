import 'package:flutter/material.dart';
import '../../../theme/official_theme.dart';

class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: double.infinity,
            height: 120.0,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, bottom: 20.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.0, 0.15),
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromRGBO(255, 90, 90, 1),
                    Color.fromRGBO(255, 144, 114, 1),
                  ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => {},
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Settings',
                      style: appBarTitle(),
                    ),
                  ),
                ),
                TextButton(onPressed: () => {}, child: Text('Save')),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(241, 246, 249, 1),
            ),
          ),
        ),
      ],
    );
  }
}
