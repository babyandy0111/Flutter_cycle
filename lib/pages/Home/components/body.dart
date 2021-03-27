import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Container(
          color: Color.fromRGBO(255, 242, 241, 1),
          width: double.infinity,
          // padding: EdgeInsets.all(50.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container( // header
                width: double.infinity,
                height: 160,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment(0.0, 0.15),
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color.fromRGBO(255, 90, 90, 1),
                                Color.fromRGBO(255, 144, 114, 1),
                              ]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100.0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color.fromRGBO(255, 242, 241, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      left: 0,
                      child: Image(
                        image: AssetImage('assets/images/bg.png'),
                      ),
                    ),
                    Positioned(
                      top: 18.0,
                      left: 25,
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          height: 1.2,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60.0,
                      left: 25,
                      child: Container(
                          alignment: Alignment(20, 20),
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.png'),
                                  fit: BoxFit.contain),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                  style: BorderStyle.solid))),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Not sent yet list",
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontSize: 16.0,
                    height: 1.2,
                  ),
                ),
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
