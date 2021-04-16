import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelSettingsEntity.dart';
import 'package:indochat_officialaccount/theme/size_config.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';

class SettingsList extends StatefulWidget {
  String imageFile;
  bool networkImage;
  ChannelSettingsEntity data;
  int index;

  @override
  _SettingsListState createState() => _SettingsListState();
  SettingsList(this.data, this.index) : super();
}

class _SettingsListState extends State<SettingsList> {
  @override
  Widget build(BuildContext context) {
    // if (data.data[index].imageUrl != null) {
    //   networkImage = true;
    // }

    SizeConfig().init(context);

    _getFromGallery() async {
      PickedFile pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        // imageFile = File(pickedFile.path);
        widget.imageFile = pickedFile.path;
      }
    }

    return Column(
      children: [
        Column(
          children: [
            AvatarImg(widget.imageFile, widget.networkImage),
            // AvatarImg(networkImage && imageFile == null
            //     ? 'https://assets.indochat.net/${data.data[index].imageUrl}'
            //     : imageFile),
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
                      'Channel ID ${widget.data.data[widget.index].title}',
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
    );
  }
}

class AvatarImg extends StatelessWidget {
  var imageFile;
  var networkImage;

  AvatarImg(imageFile, networkImage) : super();

  @override
  Widget build(BuildContext context) {
    print('imageFile: ${SettingsList().imageFile}');
    return CircleAvatar(
      radius: 66,
      backgroundColor: primaryAccentColor,
      foregroundColor: primaryAccentColor,
      child: this.imageFile == null ? null : Image.network(this.imageFile),
      backgroundImage: this.imageFile == null ? null : NetworkImage(this.imageFile),
    );
  }
}
