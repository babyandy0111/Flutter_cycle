import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelListEntity.dart';
import 'package:indochat_officialaccount/layouts/BaseLayoyt.dart';
import 'package:indochat_officialaccount/pages/Channel/widgets/SearchBar.dart';
import 'package:indochat_officialaccount/pages/Home/components/channelList.dart';
import 'package:indochat_officialaccount/pages/Home/components/header.dart';

// 繼承BaseWidget
class Body extends BaseLayoyt {
  @override
  BodyState getState() => BodyState();
}

// 繼承BaseWidgetState
class BodyState extends BaseLayoytState<Body> {
  // final TextEditingController searchController = TextEditingController();

  @override
  initState() {
    super.initState();
    super.appBarTitle = "HHH";
    // channelBloc..getList();
  }

  Widget CreatePageView() {
    log("----buildbuild---CreatePageView");
    return
      // SafeArea(
      // child: SizedBox.expand(
      //   child:
        Container(
          color: Color.fromRGBO(255, 242, 241, 1),
          width: double.infinity,
          // padding: EdgeInsets.all(50.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Header(),
              // 標題
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Not sent yet list",
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontSize: 16.0,
                    height: 1.2,
                  ),
                ),
              ),
              ChannelList(),
            ],
          ),
      //   ),
      // ),
    );


    // return Container(
    //   decoration: BoxDecoration(color: Colors.white),
    //   child: Column(
    //     children: [
    //       Container(
    //         child: Column(
    //           children: [
    //             searchBar(searchController),
    //             StreamBuilder<ChannelListEntity>(
    //               stream: channelBloc.subject.stream,
    //               builder: (context, AsyncSnapshot<ChannelListEntity> snapshot) {
    //                 if (snapshot.hasData && snapshot.data.data.length > 0) {
    //                   return channelList(context, snapshot.data);
    //                 }
    //
    //                 if (snapshot.hasData && snapshot.data.data.length == 0) {
    //                   return noData();
    //                 }
    //
    //                 if (snapshot.hasError) {
    //                   return hasError(snapshot.error);
    //                 }
    //                 return Loading();
    //               },
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}


// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox.expand(
//         child: Container(
//           color: Color.fromRGBO(255, 242, 241, 1),
//           width: double.infinity,
//           // padding: EdgeInsets.all(50.0),
//           child: ListView(
//             shrinkWrap: true,
//             children: <Widget>[
//               Header(),
//               // 標題
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Not sent yet list",
//                   style: TextStyle(
//                     color: Color.fromRGBO(128, 128, 128, 1),
//                     fontSize: 16.0,
//                     height: 1.2,
//                   ),
//                 ),
//               ),
//               ChannelList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
