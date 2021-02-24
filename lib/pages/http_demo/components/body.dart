import 'package:flutter/material.dart';
import 'package:flutter_cycle/bloc/sticker.dart';
import 'package:flutter_cycle/data/entitys/response/home_sticker_packs_entity.dart';
import '../../../data/services/config.dart';
import '../../../data/entitys/response/user_entity.dart';
import '../../../core/http/sp.dart';
import '../../../data/services/user.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            FlatButton(
                color: Colors.amber,
                onPressed: () async {
                  UserEntity data = await getUser();
                  print(data.nickname);
                },
                child: Text("get user api 請求")),
            FlatButton(
                color: Colors.amber,
                onPressed: () async {
                  getConfig();
                },
                child: Text("get config get請求")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  String token = 'jjjjj';
                  SpUtil().setToken(token).then((value) => print(value));
                },
                child: Text("set local of error token")),
            FlatButton(
                color: Colors.amber,
                onPressed: () {
                  SpUtil().getToken().then((token) => print(token));
                },
                child: Text("get local token ")),
          ],
        ),
      ),
    );
  }
}
