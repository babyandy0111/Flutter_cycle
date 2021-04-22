class LifestylePostsEntity {
  List<Posts> _posts;

  LifestylePostsEntity({
    List<Posts> posts,
  }) {
    this._posts = posts;
  }

  List<Posts> get posts => _posts;
  set posts(List<Posts> posts) => _posts = posts;

  LifestylePostsEntity.fromJson(Map<String, dynamic> json) {
    if(json['posts'] != null) {
      _posts = new List<Posts>();
      json['posts'].forEach((v) {
        _posts.add(new Posts.fromJson((v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this._posts != null) {
      data['posts'] = this._posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  List<String> _thumbnail;
  String _avatarUrl;
  int _likeCount;
  String _nickname;
  String _abstract;
  String _createdAt;

  Posts({
    List<String> thumbnail,
    String avatarUrl,
    int likeCount,
    String nickname,
    String abstract,
    String createdAt,
  }) {
    this._thumbnail = thumbnail;
    this._avatarUrl = avatarUrl;
    this._likeCount = likeCount;
    this._nickname = nickname;
    this._abstract = abstract;
    this._createdAt = createdAt;
  }

  List<String> get thumbnail => _thumbnail;
  set thumbnail(List<String> thumbnail) => _thumbnail = thumbnail;

  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl = avatarUrl;

  int get likeCount => _likeCount;
  set likeCount(int likeCount) => _likeCount = likeCount;

  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;

  String get abstract => _abstract;
  set abstract(String abstract) => _abstract = abstract;

  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  Posts.fromJson(Map<String, dynamic> json) {
    // avatar_url
    // nickname
    // thumbnail
    // like_count
    // abstract
    // created_at
    _thumbnail = new List<String>();
    json['thumbnail'].forEach((v) {
      _thumbnail.add(v);
    });

    _avatarUrl = json['avatar_url'];
    _likeCount = json['like_count'];
    _nickname = json['nickname'];
    _abstract = json['abstract'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this._thumbnail != null) {
      data['thumbnail'] = this._thumbnail.toList();
    }
    data['avatar_url'] = this._avatarUrl;
    data['like_count'] = this._likeCount;
    data['nickname'] = this._nickname;
    data['abstract'] = this.abstract;
    data['created_at'] = this.createdAt;
    return data;
  }
}