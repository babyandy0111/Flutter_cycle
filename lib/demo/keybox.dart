import 'package:flutter/material.dart';

class KeyBox extends StatefulWidget {
  @override
  _KeyBoxState createState() => _KeyBoxState();
}

class _KeyBoxState extends State<KeyBox> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text("name:"),
            TextField(),
            // TextField(key: ValueKey("1"),),
            Text("password:"),
            TextField(),
            // TextField(key: ValueKey("2"),),
          ],
        ),
    );
  }
}
