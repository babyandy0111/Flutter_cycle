import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Color.fromRGBO(255, 242, 241, 1),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Image.asset(
                "images/test2.png",
                width: 100.0,
              ),
            ),
            RaisedButton(
              color: Color.fromRGBO(255, 90, 90, 1),
              highlightColor: Color.fromRGBO(255, 150, 156, 1),
              colorBrightness: Brightness.dark,
              splashColor: Color.fromRGBO(255, 150, 156, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text("Sing In"),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
