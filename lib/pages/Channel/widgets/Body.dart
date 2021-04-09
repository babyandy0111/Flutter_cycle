import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/layouts/BaseLayoyt.dart';
import 'package:indochat_officialaccount/pages/Channel/widgets/SearchBar.dart';
import 'package:indochat_officialaccount/pages/Channel/widgets/ChannelList.dart';

///繼承BaseWidget
class Body extends BaseLayoyt {
  @override
  BodyState getState() => BodyState();
}

///繼承BaseWidgetState
class BodyState extends BaseLayoytState<Body> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    super.appBarTitle = "Channel";
  }

  Widget CreatePageView() {
    log("----buildbuild---CreatePageView");
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                searchBar(searchController),
                channelList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // //當我把預設layout設定完, CreatePageView就會沒用
  // @override
  // setBaseLayout(context) {
  //   // super.setBaseLayout();
  //   log("----buildbuild---setBaseLayout---1234567890");
  //   return Container(color: Colors.red);
  // }
}
