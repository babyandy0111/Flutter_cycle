import 'package:flutter/material.dart';

class Box extends StatefulWidget {

  // 建構變數與建構子
  final Color color;
  Box(this.color);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: Center(
        child: RaisedButton(
          onPressed: () => setState(() => _count++),
          child: Text("$_count", style: TextStyle(fontSize: 60),),
        ) ,
      ),
    );
  }
}
