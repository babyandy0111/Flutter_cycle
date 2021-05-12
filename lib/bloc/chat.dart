import 'package:flutter/material.dart';
import 'package:flutter_cycle/data/models/response/Group_channel_entity.dart';
import 'package:flutter_cycle/data/models/response/home_sticker_packs_entity.dart';
import 'package:flutter_cycle/data/repositorys/chat_repository.dart';
import 'package:flutter_cycle/data/repositorys/sticker_repository.dart';
import '../core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class ChatBloc {

  final BehaviorSubject<GroupChannelsEntity> _subject = BehaviorSubject<GroupChannelsEntity>();

  getChatList() async {
    ApiResponse<GroupChannelsEntity> entity = await ChatRepository.getChatList();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<GroupChannelsEntity> get subject => _subject;

}
final chatBloc = ChatBloc();