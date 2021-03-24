import 'package:flutter/material.dart';
import '../../../theme/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(241, 246, 249, 1)),
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 66,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color.fromRGBO(255, 144, 114, 1),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Text('Change Photo'),
                      style: TextButton.styleFrom(
                        primary: Color.fromRGBO(255, 144, 114, 1),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.zero,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.0),
                              width: SizeConfig.screenWidth,
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
                              width: SizeConfig.screenWidth,
                              child: Text(
                                  'Official',
                                  style: TextStyle(
                                    color: Colors.black87,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        Divider(height: 1.0, color: Colors.grey[400],),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15.0),
                              width: SizeConfig.screenWidth,
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
                              width: SizeConfig.screenWidth,
                              child: Text(
                                'Boss',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 1.0, color: Colors.grey[400],),
                        TextButton(
                          onPressed: () => {},
                          child: Row(
                            children: [
                              Icon(Icons.list),
                              Text('Share'),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            primary: Color.fromRGBO(255, 144, 114, 1),
                          ),
                        ),
                        Divider(height: 1.0, color: Colors.grey[400],),
                        TextButton(
                          onPressed: () => {},
                          child: Row(
                            children: [
                              Icon(Icons.list),
                              Text('Share'),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            primary: Color.fromRGBO(255, 144, 114, 1),
                          ),
                        ),
                      ],
                    ),
                ),
                FlatButton(
                  minWidth: SizeConfig.screenWidth,
                  onPressed: () => {},
                  child: Text('Delete Channel'),
                  textColor: Colors.white,
                  color: Color.fromRGBO(255, 144, 114, 1),
                ),
              ],
            ),
          ),
      ),
    );
  }
}