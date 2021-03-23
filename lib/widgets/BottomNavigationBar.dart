import 'package:flutter/material.dart';
import '../pages/Home/index.dart';
import '../pages/Login/index.dart';

class BottomNavBar extends StatefulWidget {
  final items;
  final Function onTap;

  BottomNavBar({this.items, this.onTap});

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {

  final items = [
    BottomNavBarItem(title: Text('Home'), icon: Icon(Icons.home_outlined), route: HomePage.routeName),
    BottomNavBarItem(title: Text('Channel'), icon: Icon(Icons.group), route: LoginPage.routeName),
    BottomNavBarItem(title: Text('Message'), icon: Icon(Icons.message), route: '/message'),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> barItems = [];
    for(var i = 0; i < items.length; i++) {
      barItems.add(Column(
        // 依元件決定最小高度
        mainAxisSize: MainAxisSize.min,
        // 從底部排列
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            // 依選中與否，從父裔中取得佈景主題的顏色
            color: Color.fromRGBO(255, 90, 90, 1),
            icon: items[i].icon,
            onPressed: () {
              Navigator.pushNamed(context, items[i].route);
            },
          ),
          DefaultTextStyle(
            style: TextStyle(
              // 依選中與否，從父裔中取得佈景主題的顏色
              color: Color.fromRGBO(255, 90, 90, 1),
            ),
            child: items[i].title,
          )
        ],
      ));
    }

    return BottomAppBar(
        color: Theme.of(context).bottomAppBarColor,
        child: Row(
          // 平均分配空間
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: barItems,
        )
    );
  }
}

class BottomNavBarItem {
  Widget title;
  Icon icon;
  String route;
  BottomNavBarItem({this.title, this.icon, this.route});
}
