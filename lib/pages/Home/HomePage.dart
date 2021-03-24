import 'package:flutter/material.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0), // here the desired height
      //   child: AppBar(
      //     automaticallyImplyLeading: false,
      //     title: Row(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             padding: EdgeInsets.all(20.0),
      //             child: Text('UserName'),
      //           ),
      //         ),
      //       ],
      //     ),
      //     titleSpacing: 0.0,
      //     // centerTitle: true,
      //     flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //               begin: Alignment(0.0, 0.15),
      //               end: Alignment.bottomCenter,
      //               colors: <Color>[
      //                 Color.fromRGBO(255, 90, 90, 1),
      //                 Color.fromRGBO(255, 144, 114, 1),
      //               ])
      //       ),
      //     ),
      //   ),
      // ),
      body: Body(),
    );
  }
}
