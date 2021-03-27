import 'package:flutter/material.dart';
import '../../theme/official_theme.dart';

import 'components/Body.dart';

class HistoryPage extends StatelessWidget {
  static String routeName = "/history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton.extended(
          onPressed: () => {},
          label: Text('Sent Message'),
          backgroundColor: primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
