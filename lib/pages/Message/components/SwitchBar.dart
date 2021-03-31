import 'package:flutter/material.dart';


// switch
class SwitchBar extends StatefulWidget {
  @override
  _SwitchBarState createState() => new _SwitchBarState();
}

class _SwitchBarState extends State<SwitchBar> {
  bool _switchSelected = true; //维护单选开关状态
  @override
  Widget build(BuildContext context) {
    // Stack
    return Switch.adaptive(
      value: _switchSelected, //当前状态
      activeColor: Color.fromRGBO(255, 90, 90, 1),
      onChanged: (value) {
        //重新构建页面
        setState(() {
          _switchSelected = value;
        });
      },
    );
  }
}
