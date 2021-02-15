import 'package:flutter/material.dart';
import 'package:flutter_cycle/http/lib/api_response.dart';
import 'package:flutter_cycle/http/models/user_entity.dart';
import 'cycledemo.dart';
import 'box.dart';
import 'http/lib/http_utils.dart';
import 'http/repositorys/user_repository.dart';
import 'lessbox.dart';
import 'keybox.dart';

void main() {
  HttpUtils.init(
    baseUrl: "https://api.indochat.net/",
  );
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
              LessBox(Colors.red),
              LessBox(Colors.yellow),
              LessBox(Colors.blue),
              Box(Colors.red),
              Box(Colors.yellow),
              Box(Colors.blue),
              Cycle(),
              KeyBox(),
              FlatButton(
                  color: Colors.amber,
                  onPressed: () {
                    getUser();
                  },
                  child: Text("get請求")),
            ],
          ),
        ),
      ),
    );
  }

  void getUser() async {
    ApiResponse<UserEntity> entity = await UserRepository.getUser(501);
    print(entity.data.phone);
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
