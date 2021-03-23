import 'package:flutter/material.dart';
import 'widgets/BottomNavigationBar.dart';
import 'routes.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: MaterialApp(
          home: Scaffold(),
          routes: internalRoutes,
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
      routes: routes,
    );
  }
}

