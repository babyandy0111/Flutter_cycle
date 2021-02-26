import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/default_demo/default_demo.dart';
import 'routes.dart';
import 'core/shared_preferences/sp.dart';
import 'core/http/http_utils.dart';
import 'core/config.dart';
import 'theme/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpUtils.init();

  await SpUtil.init();
  await SpUtil().setPlatform();
  await SpUtil().setDeviceUid("123456");
  await SpUtil().setPinCode("123456");
  await SpUtil().setPhone("+886973701001");
  await SpUtil().setUserId(501);
  await SpUtil().setAPPVersion(APP_VERSION);
  await SpUtil().setAPPLang(APP_LANG);

  await Firebase.initializeApp();
  await DotEnv.load(fileName: ".env");

  print(DotEnv.env['AWS_KEY']);
  // PushNotificationsManager().init();
  runApp(MyApp());
}

// StatelessWidget
// 是一個不需要狀態更改的widget - 它沒有要管理狀態 - 把它想成靜態Html
// 這個Widget一但創建後, 就無法改變裡面的內容, 要改變就要再創建一個
// 這裡可以討論一下 StatelessWidget 使用時機, 崇先new一個StatelessWidget 替換, 真的比較好嗎？
// StatelessWidget 生命週期就只會有 build
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: DefaultDemo.routeName,
      routes: routes,
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
