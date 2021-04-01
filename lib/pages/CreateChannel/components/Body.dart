import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'LeftButtonWidgets.dart';
import 'RightButtonWidgets.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isSwitched = true;
  bool _keyboardVisible = false;
  double safeH;
  File imageFile;

  @override
  Widget build(BuildContext context) {
    final double fullH = MediaQuery.of(context).size.height;
    final double keyboardH = WidgetsBinding.instance.window.viewInsets.bottom;

    _keyboardVisible = keyboardH != 0;

    SizeConfig().init(context);

    return LayoutBuilder(builder: (context, constraints) {
      if (!_keyboardVisible) {
        safeH = constraints.maxHeight;
      }

      final String title = 'Create Channel';
      final double paddingTop = fullH - safeH;

      _getFromGallery() async {
        PickedFile pickedFile = await ImagePicker().getImage(
          source: ImageSource.gallery,
          maxWidth: 1800,
          maxHeight: 1800,
        );
        if (pickedFile != null) {
          setState(() {
            imageFile = File(pickedFile.path);
          });
        }
      }

      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
          child: Column(
            children: [
              HeaderBar(
                title,
                paddingTop,
                radiusBarBgColor: Color.fromRGBO(255, 242, 241, 1),
                leftButtonWidgets: LeftButtonWidgets(),
                rightButtonWidgets: RightButtonWidgets(),
              ),
              Column(
                children: [
                  imageFile == null
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          child: CircleAvatar(
                            radius: 66,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: primaryAccentColor,
                            ),
                          ),
                          onPressed: () => {_getFromGallery()},
                        )
                      : CircleAvatar(
                          radius: 66,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(imageFile),
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
    });
  }
}
