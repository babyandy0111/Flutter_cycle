import 'package:flutter/material.dart';

class LessBox extends StatelessWidget {

  // 建構變數與建構子
  final Color color;
  LessBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(
        child: RaisedButton(
          onPressed: () => {
            print("onPressed")
          },
          child: Text("HI", style: TextStyle(fontSize: 60),
          ),
        ),
      ),
    );
  }
}
