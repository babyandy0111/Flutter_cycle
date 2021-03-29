import 'package:flutter/material.dart';
import '../../../theme/size_config.dart';
import '../../../theme/official_theme.dart';
import 'AppBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
        child: Column(
          children: [
            HeaderBar(),
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
