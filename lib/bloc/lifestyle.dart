import 'package:flutter/material.dart';
import 'package:flutter_cycle/data/models/response/lifestyle_posts_entity.dart';
import 'package:flutter_cycle/data/repositorys/lifestyle_repository.dart';
import '../core/http/api_response.dart';
import 'package:rxdart/rxdart.dart';

class LifestylePostsBloc {

  final BehaviorSubject<LifestylePostsEntity> _subject = BehaviorSubject<LifestylePostsEntity>();

  getLifestylePosts() async {
    ApiResponse<LifestylePostsEntity> entity = await LifestyleRepository.getLifestylePosts();
    _subject.sink.add(entity.data);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  dispose() {
    _subject.close();
  }

  BehaviorSubject<LifestylePostsEntity> get subject => _subject;

}
final lifestylePostsBloc = LifestylePostsBloc();