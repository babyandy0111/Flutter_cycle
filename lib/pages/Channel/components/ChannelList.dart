import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:indochat_officialaccount/theme/official_theme.dart';
import 'package:indochat_officialaccount/pages/Settings/SettingsPage.dart';

class ChannelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.18,
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/test.png'),
                            fit: BoxFit.contain),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Channel Name",
                        style: TextStyle(
                          color: Color.fromRGBO(29, 53, 87, 1),
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "Follow 3",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 150, 156, 1),
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              color: Color.fromRGBO(128, 128, 128, 1),
              icon: Icons.settings,
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SettingsPage();
                }))
              },
            ),
            IconSlideAction(
              color: primaryColor,
              icon: Icons.link_rounded,
              onTap: () => {},
            ),
          ],
        ),
      ],
    );
  }
}
