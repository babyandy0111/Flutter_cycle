import 'dart:convert';
// import 'dart:html';
import 'package:dio/dio.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cycle/qtcomm_listview_widget_parser.dart';
import 'qtcomm_listtitle_widget_parser.dart';
import 'box.dart';
import 'new_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      routes: <String, WidgetBuilder> {
        '/cycle_page': (BuildContext context) => NewPage(),
        '/myapp' : (BuildContext context) => MyApp(),
        '/keybox' : (BuildContext context) => Box(Colors.blue),
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double paddingTop = mediaQueryData.padding.top;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFB86C6A),
              height: paddingTop,
            ),
            Expanded(
              child: FutureBuilder(
                future: _buildWidgetFromApi(context),
                builder: (context, snapshot) {
                  var connectionState = snapshot.connectionState;
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else if (connectionState == ConnectionState.active || connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      child: snapshot.data,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> _buildWidgetFromApi(BuildContext context) async {

    var response = await rootBundle.loadString('assets/hello-world.json');
    await Future.delayed(Duration(seconds: 2));
    DynamicWidgetBuilder.addParser(QTListViewWidgetParser());
    DynamicWidgetBuilder.addParser(QTListTileWidgetParser());
    return DynamicWidgetBuilder.build(response, context, DefaultClickListener(context));

    // Get JSON from endpoint
    /*var response = await Dio().get('https://www.shihjie.com/api/profile-page.json');
    var responseJson = json.encode(response.data);
    return DynamicWidgetBuilder.build(responseJson, context, DefaultClickListener());*/
  }
}

class DefaultClickListener extends ClickListener {

  BuildContext context;
  DefaultClickListener(this.context);

  @override
  void onClicked(String event) {
    // TODO: do something in here when receive clicked
    print("Receive click event: " + event);
    //Navigator.of(context).pushNamed(event);
  }
}