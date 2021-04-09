import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/data/models/response/ChannelListEntity.dart';
import 'package:indochat_officialaccount/data/repositorys/ChannelListRepository.dart';
import 'package:indochat_officialaccount/core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class ChannelBloc {

  final BehaviorSubject<ChannelListEntity> _subject = BehaviorSubject<ChannelListEntity>();

  getList() async {
    ApiResponse<ChannelListEntity> entity = await ChannelListRepository.getChannelList();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ChannelListEntity> get subject => _subject;

}
final channelBloc = ChannelBloc();