import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelSettingsEntity.dart';
import 'package:indochat_officialaccount/data/repositorys/ChannelSettingsRepository.dart';
import 'package:indochat_officialaccount/core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class ChannelSettingsBloc {

  final BehaviorSubject<ChannelSettingsEntity> _subject = BehaviorSubject<ChannelSettingsEntity>();

  getList() async {
    ApiResponse<ChannelSettingsEntity> entity = await ChannelSettingsRepository.getChannelList();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ChannelSettingsEntity> get subject => _subject;

}
final channelSettingsBloc = ChannelSettingsBloc();