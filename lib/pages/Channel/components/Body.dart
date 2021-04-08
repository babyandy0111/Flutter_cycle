import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/layouts/BodyLayout.dart';
import 'package:indochat_officialaccount/widgets/AppBar.dart';

import 'RightButtonWidgets.dart';
import 'ChannelList.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = 'Channel';
    return BodyLayout(BodyWidget(title, paddingTop));
  }
}

class BodyWidget extends StatefulWidget {
  final String title;

  BodyWidget(this.title, paddingTop) : super();

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  TextEditingController searchController = TextEditingController();
  String filter;

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
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            HeaderBar(widget.title, paddingTop,
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
  }
}
