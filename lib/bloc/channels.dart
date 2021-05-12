import 'package:flutter/material.dart';
import 'package:flutter_cycle/data/models/response/channels_entity.dart';
import 'package:flutter_cycle/data/repositorys/channels_repository.dart';
import '../core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class ChannelsBloc {

  final BehaviorSubject<ChannelsEntity> _subject = BehaviorSubject<ChannelsEntity>();

  postChannelsList() async {
    ApiResponse<ChannelsEntity> entity = await ChannelsRepository.postChannelsList();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ChannelsEntity> get subject => _subject;

}
final chatBloc = ChannelsBloc();