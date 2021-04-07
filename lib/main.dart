import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:indochat_officialaccount/core/config.dart';
import 'package:indochat_officialaccount/core/shared_preferences/sp.dart';
import 'pages/Login/LoginPage.dart';
import 'routes.dart';
import 'theme/theme.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  print(DotEnv.env['AWS_KEY']);

  await SpUtil.init();
  await SpUtil().setPlatform();
  await SpUtil().setDeviceUid("123456");
  await SpUtil().setPinCode("123456");
  await SpUtil().setPhone("+886973701001");
  await SpUtil().setUserId(501);
  await SpUtil().setAPPVersion(APP_VERSION);
  await SpUtil().setAPPLang(APP_LANG);

  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: LoginPage(),
      routes: routes,
    );
  }
}

