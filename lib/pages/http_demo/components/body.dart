import 'package:flutter/material.dart';
import 'package:flutter_cycle/layouts/base_layout.dart';
import 'package:flutter_cycle/main.dart';
import 'package:flutter_cycle/pages/sign_in/sign_in.dart';
import '../../../data/services/config.dart';
import '../../../data/models/response/user_entity.dart';
import '../../../core/shared_preferences/sp.dart';
import '../../../data/services/user.dart';

class Body extends BaseLayoyt {
  @override
  _BodyState getState() => _BodyState();
}

class _BodyState extends BaseLayoytState<Body> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget CreatePageView() {
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
                    String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb3VudHJ5IjoiSUQiLCJkZXZpY2VfdWlkIjoiMTIzNDU2IiwiZXhwIjoxNjE2ODI4MjU0LCJpYXQiOjE2MTQyMzYyNTQsImlzcyI6IkluZG9DaGF0IiwicGhvbmUiOiIrODg2OTczNzAxMDAxIiwidXNlcl9pZCI6IjUwMSJ9.SvtmZFk4iKLyR-36zSj9PBTCwo3IGzHxgSgOb1BPpMk';
                    SpUtil().setToken(token).then((value) => showSnackbar("set local ok token: " + value.toString()));
                  },
                  child: Text("set local of ok token")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () async {
                    String duid = await SpUtil().getDeviceUid();
                    String pin = await SpUtil().getPinCode();
                    int uid = await SpUtil().getUserId();
                    String phone = await SpUtil().getPhone();
                    String localtoken = await SpUtil().getToken();
                    showSnackbar("local:${duid}/${pin}/${uid}/${phone}/${localtoken}");
                  },
                  child: Text("get local token ")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () async {
                    await SpUtil().removeIsLogin("islogin");
                    Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (BuildContext ctx) => MyApp()));
                  },
                  child: Text("logout")),
            ],
          ),
        ),
      ),
    );
  }
}
