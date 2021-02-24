import 'package:flutter/material.dart';
import 'package:flutter_cycle/data/models/response/home_sticker_packs_entity.dart';
import 'package:flutter_cycle/data/repositorys/sticker_repository.dart';
import '../core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class HomeStickerPacksBloc {

  final BehaviorSubject<HomeStickerPacksEntity> _subject = BehaviorSubject<HomeStickerPacksEntity>();

  getHomeStickerPacks() async {
    ApiResponse<HomeStickerPacksEntity> entity = await StickerRepository.getHomeStickerPacks();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<HomeStickerPacksEntity> get subject => _subject;

}
final homeStickerPacksBloc = HomeStickerPacksBloc();