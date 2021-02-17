import 'package:flutter/material.dart';

class LessBox extends StatelessWidget {

  // 建構變數與建構子
  final Color color;
  LessBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      color: color,
      child: Center(
        child: RaisedButton(
          onPressed: () => {
            print("onPressed")
          },
          child: Text("HI", style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
