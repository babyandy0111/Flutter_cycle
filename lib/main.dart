import 'package:flutter/material.dart';
import 'http/lib/sp.dart';
import 'http/services/user.dart';
import 'http/lib/http_utils.dart';
import 'http/lib/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpUtils.init(
    baseUrl: IM_BASE_URL,
  );
  await SpUtil.init();
  runApp(MyApp());
}

// StatelessWidget
// 是一個不需要狀態更改的widget - 它沒有要管理狀態 - 把它想成靜態Html
// 這個Widget一但創建後, 就無法改變裡面的內容, 要改變就要再創建一個
// 這裡可以討論一下 StatelessWidget 使用時機, 崇先new一個StatelessWidget 替換, 真的比較好嗎？
// StatelessWidget 生命週期就只會有 build
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Andy Flutter 教室'),
        ),
        body: Center(
          child: Column(
            children: [
              // LessBox(Colors.red),
              // LessBox(Colors.yellow),
              // LessBox(Colors.blue),
              // Box(Colors.red),
              // Box(Colors.yellow),
              // Box(Colors.blue),
              // Cycle(),
              // KeyBox(),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    getUser();
                  },
                  child: Text("get user api 請求")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () async {
                    SpUtil().setDeviceUid("123456");
                    SpUtil().setPinCode("123456");
                    SpUtil().setUserId(501);
                    SpUtil().refreshToken();
                    SpUtil().getToken().then((token) => print(token));
                  },
                  child: Text("refreshToken poet請求")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    String token =
                        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb3VudHJ5IjoiSUQiLCJkZXZpY2VfdWlkIjoiMTIzNDU2IiwiZXhwIjoxNjE0ODUxNTAxLCJpYXQiOjE2MTIyNTk1MDEsImlzcyI6IkluZG9DaGF0IiwicGhvbmUiOiIrODg2OTczNzAxMDAxIiwidXNlcl9pZCI6IjUwMSJ9.GHyMb1_5YYNtCzcFLOIYJNNO_TXh2ZBZnEpYs80H14c';
                    SpUtil().setToken(token).then((value) => print(value));
                  },
                  child: Text("set local token")),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    SpUtil().getToken().then((token) => print(token));
                  },
                  child: Text("get local token ")),
            ],
          ),
        ),
      ),
    );
  }
}

// 基本上Flutter學習曲線
// 了解生命週期, 知道哪裡該寫啥, 哪裡不該寫啥
// 學習event使用, onPressed, 就是 onclick
// 學習跳頁, Navigator.push, 就是Html的redirect
// 學習帶值, key val, 就是Html的get, post
// 瞭解status的使用, 就是session, 搭配UI使用, 就好比Ajax
// 進階的list, route, widget, 儲存, sqlite, etc...
// https://www.mdeditor.tw/pl/gmiz/zh-tw
