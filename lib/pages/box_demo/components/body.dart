import 'package:flutter/material.dart';

class Body extends StatefulWidget {

  // 建構變數與建構子
  final Color color;
  Body(this.color);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      color: widget.color,
      child: Center(
        child: RaisedButton(
          onPressed: () => setState(() => _count++),
          child: Text("$_count", style: TextStyle(fontSize: 20),),
        ) ,
      ),
    );
  }
}
