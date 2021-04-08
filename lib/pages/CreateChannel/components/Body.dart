import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';
import 'package:indochat_officialaccount/layouts/BodyLayout.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'LeftButtonWidgets.dart';
import 'RightButtonWidgets.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'Create Channel';
    return BodyLayout(BodyWidget(title, paddingTop));
  }
}

class BodyWidget extends StatefulWidget {
  final String title;
  final double paddingTop;

  BodyWidget(this.title, this.paddingTop) : super();

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  bool isSwitched = true;
  File imageFile;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
              widget.title,
              widget.paddingTop,
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
                  onPressed: () => {_getFromGallery()},
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
