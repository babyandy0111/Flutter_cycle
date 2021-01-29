// 起手式
import 'package:flutter/material.dart';
class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState(); // createState 用來建立widget
}

// WidgetsBindingObserver 是APP的生命週期
// 你了解super嗎？
class _NewPageState extends State<NewPage> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('$state');
  }

  // 一開始一定會進來此func, 通常拿來進行初始化設定
  // initState 是 StatefulWidget 建立後進入的第一個func
  // 而且只執行一次，類似 Android 的 onCreate、iOS 的 viewDidLoad()
  @override
  void initState() {
    super.initState();
    print('initState+++');
    WidgetsBinding.instance.addObserver(this);
  }

  // initState 執行後, 立刻會執行didChangeDependencies
  // 之後 StatefulWidget 進行刷新，也就不會執行了，
  // 除非你的 StatefulWidget 所依赖的 InheritedWidget 發生變化，didChangeDependencies 才會再次進入
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies+++');
  }

  // widget 的配置發生變化時，會調用此函式。
  // 這個生命週期我們一般不會用到，只有在使用 key 對 Widget 進行復用的時候才會調用
  @override
  void didUpdateWidget(NewPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget+++');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble+++');
  }

  // view 消失前會先經過此func, 接著才有可能經過dispose
  // 類似 android 的 onResume, ios 的 viewDiddisapper()
  // 通常用來進行暫存資料
  @override
  void deactivate() {
    print('deactivate+++');
    super.deactivate();
  }

  // 在銷毀前觸發，通常我們可以在這個階段進行釋放資源。
  // Android 的 onDestroy, IOS 的 viewDidDisappear()
  @override
  void dispose() {
    super.dispose();
    print('dispose+++');
    WidgetsBinding.instance.removeObserver(this);
  }

  // 需要更新state, 手動更新時會觸發
  @override
  void setState(VoidCallback fn) {
    print('setState+++');
  }

  // 每當 UI 需要重新渲染的時候，build 都會被調用，
  // 所以 build 會被多次調用，然後 返回要渲染的 Widget。
  // 千萬不要在 build 裡做除了創建 Widget 之外的操作，因為這個會影響 UI 的渲染效率。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是 B 頁'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('返回首頁'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}