import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'LeftButtonWidgets.dart';
import 'RightButtonWidgets.dart';

class Body extends StatefulWidget {
  final String title;
  final double paddingTop;
  static bool isSwitched = true;

  Body(this.title, this.paddingTop) : super();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
          child: Column(
            children: [
              HeaderBar(
                widget.title,
                widget.paddingTop,
                radiusBarBgColor: Color.fromRGBO(255, 242, 241, 1),
                leftButtonWidgets: LeftButtonWidgets(),
                rightButtonWidgets: RightButtonWidgets(),
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 66,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: primaryAccentColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: Text('Change Photo'),
                    style: TextButton.styleFrom(
                      primary: primaryAccentColor,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          width: SizeConfig.screenWidth / 2,
                          child: Text(
                            'Channel Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          width: SizeConfig.screenWidth / 2,
                          child: Text(
                            'Official',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey[400],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          width: SizeConfig.screenWidth / 2,
                          child: Text(
                            'Owner',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          width: SizeConfig.screenWidth / 2,
                          child: Text(
                            'Boss',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey[400],
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Row(
                        children: [
                          Icon(Icons.qr_code),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text('SID9 Code'),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: primaryAccentColor,
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey[400],
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text('Share URL'),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: primaryAccentColor,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(SizeConfig.screenWidth, 0),
                  padding: EdgeInsets.all(15.0),
                  backgroundColor: primaryAccentColor,
                ),
                onPressed: () => {},
                child: Text('Delete Channel'),
              ),
            ],
          ),
        ),
      );
  }
}
