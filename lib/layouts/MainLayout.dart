import 'package:flutter/material.dart';
import '../widgets/BottomNavigationBar.dart';

class MainLayout extends StatelessWidget {
  static String routeName = "/bottomBarLayout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
    );
  }
}