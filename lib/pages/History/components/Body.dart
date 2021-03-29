import 'package:flutter/material.dart';
import '../../../theme/size_config.dart';
import '../../../theme/official_theme.dart';
import 'AppBar.dart';

class MessageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: primaryAccentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Pending',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: primaryAccentColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'ut eu sem integer vitae',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                        ),
                        Divider(color: Colors.grey[50]),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Schedule Time: ',
                                        style: TextStyle(
                                            color: Colors.grey[50],
                                            fontSize: 14.0),
                                      ),
                                      Text(
                                        '2021-03-31 17:00',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      '2021-03-31',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'ut eu sem integer vitae',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          dense: true,
                        ),
                        Divider(color: Colors.black54),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '17:00',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // bool isPending = false;
    // String message;
    // String messageDate;
    // String messageTime;

    SizeConfig().init(context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
        child: Column(
          children: [
            HeaderBar(),
            MessageBubble(),
          ],
        ),
      ),
    );
  }
}
