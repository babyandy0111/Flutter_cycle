import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'pages/Login/LoginPage.dart';
import 'routes.dart';
import 'theme/theme.dart';

void main() async {
  await DotEnv.load(fileName: ".env");
  print(DotEnv.env['AWS_KEY']);

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

