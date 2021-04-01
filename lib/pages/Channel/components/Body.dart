import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'RightButtonWidgets.dart';
import 'ChannelList.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController searchController = TextEditingController();
  String filter;
  bool _keyboardVisible = false;
  double safeH;

  @override
  initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double fullH = MediaQuery.of(context).size.height;
    final double keyboardH = WidgetsBinding.instance.window.viewInsets.bottom;

    _keyboardVisible = keyboardH != 0;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!_keyboardVisible) {
          safeH = constraints.maxHeight;
        }

        final String title = 'Channel';
        final double paddingTop = fullH - safeH;

        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                HeaderBar(title, paddingTop,
                    showRightButtonWidgets: true,
                    rightButtonWidgets: RightButtonWidgets()),
                Container(
                  child: Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search_rounded),
                              filled: true,
                              fillColor: Color.fromRGBO(255, 242, 241, 1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.only(
                                  left: 15.0, right: 15.0, bottom: 15.0),
                              shrinkWrap: true,
                              itemCount: 8,
                              itemBuilder: (context, index) => ChannelList()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
