import 'package:flutter/material.dart';
import 'package:flutter_cycle/bloc/sticker.dart';
import 'package:flutter_cycle/data/models/response/home_sticker_packs_entity.dart';
import '../../../data/services/config.dart';
import '../../../data/models/response/user_entity.dart';
import '../../../core/shared_preferences/sp.dart';
import '../../../data/services/user.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Center(
          child: Column(
            children: [
              FlatButton(
                  color: Colors.amber,
                  onPressed: () async {
                    UserEntity data = await getUser();
                    showSnackbar("nickname: " + data.nickname);
                  },
                  child: Text("get user api 請求")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () async {
                    String awsKey = await getConfig();
                    showSnackbar("aws key: " + awsKey);
                  },
                  child: Text("get config get請求")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    String token = 'jjjjj';
                    SpUtil().setToken(token).then((value) => showSnackbar("set local error token: " + value.toString()));
                  },
                  child: Text("set local of error token")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    SpUtil().getToken().then((token) => showSnackbar("local token: " + token));
                  },
                  child: Text("get local token ")),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
