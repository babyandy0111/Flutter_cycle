import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';
import 'package:indochat_officialaccount/layouts/BaseLayoyt.dart';

class Body extends BaseLayoyt {
  final int channelId;

  Body(this.channelId) : super();

  @override
  BodyState getState() => BodyState();
}

class BodyState extends BaseLayoytState<Body> {
  File imageFile;

  @override
  initState() {
    super.initState();
    super.appBarTitle = 'Settings';
  }

  Widget CreatePageView() {
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

    return Container(
      // TODO: appbar 背景變色
      // decoration: BoxDecoration(color: Color.fromRGBO(255, 242, 241, 1)),
      // TODO: 建假資料、拆分 widegt
      child: Column(
        children: [
          Column(
            children: [
              imageFile == null
                  ? CircleAvatar(
                      radius: 66,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: primaryAccentColor,
                      ),
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
                        'Channel ID ${widget.channelId}',
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
    );
  }
}
