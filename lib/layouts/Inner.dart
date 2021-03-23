import 'package:flutter/material.dart';
import '../widgets/BottomNavigationBar.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        items: [
          BottomNavBarItem(title: Text('Home'), icon: Icon(Icons.home_outlined)),
          BottomNavBarItem(title: Text('Channel'), icon: Icon(Icons.group)),
          BottomNavBarItem(title: Text('Message'), icon: Icon(Icons.message)),
        ],
      ),
    );
  }
}
