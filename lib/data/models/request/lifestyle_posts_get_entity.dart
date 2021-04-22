class LifestylePostsGetEntity {
  int _userId;

  LifestylePostsGetEntity({int userId}) {
    this._userId = userId;
  }

  int get userId => _userId;
  set userId(int userId) => _userId = userId;

  LifestylePostsGetEntity.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    return data;
  }
}
