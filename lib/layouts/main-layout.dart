import 'package:flutter/material.dart';
import 'package:flutter_cycle/widegets/bottom_navigation.dart';

class MainLayout extends StatelessWidget {
  static String routeName = "/bottomBarLayout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
    );
  }
}