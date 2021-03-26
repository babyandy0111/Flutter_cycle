import 'package:flutter/material.dart';
import '../../../theme/size_config.dart';
import '../../../theme/official_theme.dart';
import 'AppBar.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;

    SizeConfig().init(context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(241, 246, 249, 1)),
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
                  child: Text('Add Photo'),
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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Channel Name',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Owner',
                      labelStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
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
                          'Type Public',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Switch(
                        value: isSwitched,
                        activeTrackColor: primaryColor,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ],
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
