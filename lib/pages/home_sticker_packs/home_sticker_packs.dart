import 'package:flutter/material.dart';
import '../../theme/size_config.dart';
import '../home_sticker_packs//components/body.dart';

class HomeStickerPacks extends StatelessWidget {
  static String routeName = "/home_stick_packs";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Andy Flutter 教室'),
      ),
      body: Body(),
    );
  }
}
