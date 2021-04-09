import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/bloc/channel.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelListEntity.dart';
import 'package:indochat_officialaccount/layouts/BaseLayoyt.dart';
import 'package:indochat_officialaccount/pages/Channel/widgets/SearchBar.dart';
import 'package:indochat_officialaccount/widgets/BlocComWidget.dart';

import 'ChannelList.dart';


///繼承BaseWidget
class Body extends BaseLayoyt {
  @override
  BodyState getState() => BodyState();
}

///繼承BaseWidgetState
class BodyState extends BaseLayoytState<Body> {
  final TextEditingController searchController = TextEditingController();

  @override
  initState() {
    super.initState();
    super.appBarTitle = "Channel";
    channelBloc..getList();
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
                StreamBuilder<ChannelListEntity>(
                  stream: channelBloc.subject.stream,
                  builder: (context, AsyncSnapshot<ChannelListEntity> snapshot) {
                    if (snapshot.hasData && snapshot.data.data.length > 0) {
                      return channelList(context, snapshot.data);
                    }

                    if (snapshot.hasData && snapshot.data.data.length == 0) {
                      return noData();
                    }

                    if (snapshot.hasError) {
                      return hasError(snapshot.error);
                    }
                    return Loading();
                  },
                )
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
