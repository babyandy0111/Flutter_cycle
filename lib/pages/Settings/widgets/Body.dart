import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/bloc/channel_settings.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelSettingsEntity.dart';

import 'package:indochat_officialaccount/layouts/BaseLayout.dart';
import 'package:indochat_officialaccount/widgets/BlocComWidget.dart';
import 'package:indochat_officialaccount/pages/Settings/widgets/SettingsList.dart';

class Body extends BaseLayout {
  final int channelId;

  Body(this.channelId) : super();

  @override
  BodyState getState() => BodyState();
}

class BodyState extends BaseLayoutState<Body> {

  @override
  initState() {
    super.initState();
    super.appBarTitle = 'Settings';
    channelSettingsBloc..getList();
  }

  Widget CreatePageView() {

    return Container(
      child: StreamBuilder<ChannelSettingsEntity>(
        stream: channelSettingsBloc.subject.stream,
        builder: (context, AsyncSnapshot<ChannelSettingsEntity> snapshot) {
          if (snapshot.hasData && snapshot.data.data.length > 0) {
            return SettingsList(snapshot.data, widget.channelId);
          }

          if (snapshot.hasData && snapshot.data.data.length == 0) {
            return noData();
          }

          if (snapshot.hasError) {
            return hasError(snapshot.error);
          }
          return Loading();
        },
      ),
    );

  }
}
