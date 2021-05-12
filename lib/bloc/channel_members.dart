import 'package:flutter/material.dart';
import 'package:flutter_cycle/data/models/response/channel_members_entity.dart';
import 'package:flutter_cycle/data/repositorys/channel_members_repository.dart';
import '../core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class ChannelMembersBloc {

  final BehaviorSubject<ChannelMembersEntity> _subject = BehaviorSubject<ChannelMembersEntity>();

  getMembersList() async {
    ApiResponse<ChannelMembersEntity> entity = await ChannelMembersRepository.getMembersList();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ChannelMembersEntity> get subject => _subject;

}
final chatBloc = ChannelMembersBloc();