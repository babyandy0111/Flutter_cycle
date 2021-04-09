import 'package:flutter/material.dart';

Widget Loading() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 25.0,
        width: 25.0,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          strokeWidth: 4.0,
        ),
      )
    ],
  ));
}

Widget hasError(String error) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Error occured: $error"),
    ],
  ));
}

Widget noData() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "No More",
              style: TextStyle(color: Colors.black45),
            )
          ],
        )
      ],
    ),
  );
}

