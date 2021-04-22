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
  String _avatarUrl;

  Posts({
    String avatarUrl,
  }) {
    this._avatarUrl = avatarUrl;
  }

  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl = avatarUrl;

  Posts.fromJson(Map<String, dynamic> json) {
    // avatar_url
    // nickname
    // thumbnail
    // like_count
    // abstract
    // created_at
    _avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this._avatarUrl;
    return data;
  }
}

