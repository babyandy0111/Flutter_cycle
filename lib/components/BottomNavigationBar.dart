import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final items;
  final Function onTap;

  BottomNavBar({this.items, this.onTap});

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    final barItems = List<Widget>();
    for(var i = 0; i < widget.items.length; i++) {
      barItems.add(Column(
        // 依元件決定最小高度
        mainAxisSize: MainAxisSize.min,
        // 從底部排列
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            // 依選中與否，從父裔中取得佈景主題的顏色
            color: Color.fromRGBO(255, 90, 90, 1),
            icon: widget.items[i].icon,
            onPressed: () {
              setState(() {
                selectedIdx = i;
                widget.onTap(i);
              });
            },
          ),
          DefaultTextStyle(
            style: TextStyle(
              // 依選中與否，從父裔中取得佈景主題的顏色
              color: Color.fromRGBO(255, 90, 90, 1),
            ),
            child: widget.items[i].title,
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
  BottomNavBarItem({this.title, this.icon});
}
