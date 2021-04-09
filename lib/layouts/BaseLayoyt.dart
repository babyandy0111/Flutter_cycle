import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/widgets/AppBarWidget.dart';

abstract class BaseLayoyt extends StatefulWidget {
  BaseLayoytState baseWidgetState;
  @override
  BaseLayoytState createState() {
    baseWidgetState = getState();
    return baseWidgetState;
  }

  BaseLayoytState getState();
}

abstract class BaseLayoytState<T extends BaseLayoyt> extends State<T>
    with WidgetsBindingObserver {
  String appBarTitle = "";

  @override
  void initState() {
    log("----buildbuild---initState");
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log("----buildbuild---didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    log("----buildbuild---deactivate");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    log("----buildbuild---build");
    return setBaseLayout(context);
  }

  @override
  void dispose() {
    log("----buildbuild---dispose");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log("----buildbuild---didChangeAppLifecycleState");
    super.didChangeAppLifecycleState(state);
  }

  Widget setBaseLayout(context) {
    log("----buildbuild---setBaseLayout");

    return Scaffold(
        body: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                appBar(context, appBarTitle),
                CreatePageView(),
              ],
            ),
          );
        }));
  }

  Widget CreatePageView();
}
