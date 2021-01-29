// 起手式
import 'package:flutter/material.dart';
import 'new_page.dart';

// StatefulWidget 是可以改變狀態的widget
// 可以使用setState 方法管理狀態
// 當使用setState 方法時, 會重新調用調用 build方法, 讓整個應用程式獲取最新的狀態
// 繼承StatefulWidget時, 會先調用createState(),
// 這裡又可以討論一下, 雖然不用new, 但調用build的方法, 等同刷新, 這算好嗎？
class Cycle extends StatefulWidget {
  @override
  _CyclePageState createState() => _CyclePageState();
}

class _CyclePageState extends State<Cycle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('跳到 B 頁'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewPage()));
        },
      ),
    );
  }
}