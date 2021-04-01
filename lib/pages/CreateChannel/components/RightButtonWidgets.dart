import 'package:flutter/material.dart';

class RightButtonWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: TextButton(
        onPressed: () => {},
        child: Text('Save'),
      ),
    );
  }
}
