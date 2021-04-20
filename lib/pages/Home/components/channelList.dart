import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelListEntity.dart';
import 'package:indochat_officialaccount/theme/official_theme.dart';

Widget channelList(BuildContext context, ChannelListEntity data) {

  print(data.count);
  Widget divider = Divider(
    height: 5,
    color: Color.fromRGBO(255, 242, 241, 1),
  );
  // Widget divider2 = Divider(color: Colors.green);
  return Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(
        maxHeight: 680,
      ),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            // return index % 2 == 0 ? divider1 : divider2;
            return divider ;
          },
          shrinkWrap: true,
          itemCount: data.count,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.18,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: IntrinsicHeight(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                data.data[index].title,
                                style: TextStyle(
                                  color: Color.fromRGBO(29, 53, 87, 1),
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                data.data[index].subtitle,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 150, 156, 1),
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),


                  // 往右滑有複製跟設定按鈕
                  // secondaryActions: <Widget>[
                  //   IconSlideAction(
                  //     color: Color.fromRGBO(128, 128, 128, 1),
                  //     icon: Icons.settings,
                  //     onTap: () => {},
                  //   ),
                  //   IconSlideAction(
                  //     color: primaryColor,
                  //     icon: Icons.link_rounded,
                  //     onTap: () => {},
                  //   ),
                  // ],


                ),
              ],
            );
          }));
}


//
// class ChannelList extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       // padding: EdgeInsets.symmetric(horizontal: 20),
//       padding: EdgeInsets.all(20),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           // list
//           Container(
//             padding: EdgeInsets.all(20),
//             margin: EdgeInsets.only(bottom: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                     alignment: Alignment(20, 20),
//                     width: 60,
//                     height: 60,
//                     margin: EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/test.png'),
//                           fit: BoxFit.contain),
//                     )),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Channel Name",
//                       style: TextStyle(
//                         color: Color.fromRGBO(29, 53, 87, 1),
//                         fontSize: 18.0,
//                         height: 1.5,
//                       ),
//                     ),
//                     Text(
//                       "Pending post3",
//                       style: TextStyle(
//                         color: Color.fromRGBO(255, 150, 156, 1),
//                         fontSize: 16.0,
//                         height: 1.7,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }