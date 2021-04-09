import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/pages/CreateChannel/CreateChannelPage.dart';

Widget appBar(context, title) {
  return Container(
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.only(top: 80),
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment(0.0, 0.15),
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(255, 90, 90, 1),
            Color.fromRGBO(255, 144, 114, 1),
          ]),
    ),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              leftButtonWidgets(context),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              rightButtonWidgets(context, CreateChannelPage()),
            ],
          ),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget rightButtonWidgets(context, CreateChannelPage event) {
  return Positioned(
    right: 0,
    child: IconButton(
        icon: Icon(Icons.add),
        color: Colors.white,
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return event;
          }))
        }),
  );
}

Widget leftButtonWidgets(context) {
  return Positioned(
    left: 0,
    child: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        color: Colors.white,
        onPressed: () => {

        }),
  );
}
