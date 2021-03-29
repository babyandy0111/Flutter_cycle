import 'package:flutter/material.dart';
import '../../../layouts/MainLayout.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton.icon(
        label: Text('Login'),
        icon: Icon(Icons.login),
        onPressed: () => {
          Navigator.pushNamed(context, MainLayout.routeName)
        },
      ),
    );
  }

}
