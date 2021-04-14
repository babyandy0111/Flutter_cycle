import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container( // header
      width: double.infinity,
      height: 180, //160
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: 140,
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
            top: 120.0,
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
            top: 20,
            left: 0,
            child: Image(
              image: AssetImage('assets/images/bg.png'),
            ),
          ),
          Positioned(
            top:40,
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
            top: 75.0,
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
    );
  }
}