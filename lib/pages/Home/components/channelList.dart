import 'package:flutter/material.dart';

class ChannelList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // list
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment(20, 20),
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/test.png'),
                          fit: BoxFit.contain),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Channel Name",
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Pending post3",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 150, 156, 1),
                        fontSize: 16.0,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment(20, 20),
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/test.png'),
                          fit: BoxFit.contain),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Channel Name",
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Pending post3",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 150, 156, 1),
                        fontSize: 16.0,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment(20, 20),
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/test.png'),
                          fit: BoxFit.contain),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Channel Name",
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Pending post3",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 150, 156, 1),
                        fontSize: 16.0,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment(20, 20),
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/test.png'),
                          fit: BoxFit.contain),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Channel Name",
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Pending post3",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 150, 156, 1),
                        fontSize: 16.0,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                    alignment: Alignment(20, 20),
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/test.png'),
                          fit: BoxFit.contain),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Channel Name",
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Pending post3",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 150, 156, 1),
                        fontSize: 16.0,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}