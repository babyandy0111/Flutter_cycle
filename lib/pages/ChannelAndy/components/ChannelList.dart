import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';

Widget channelList(BuildContext context) {
  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(color: Colors.green);
  return Container(
      constraints: BoxConstraints(
        maxHeight: 600,
      ),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
          padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
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
                                "Channel Name {$index}",
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
                      onTap: () => {},
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
          }));
}
