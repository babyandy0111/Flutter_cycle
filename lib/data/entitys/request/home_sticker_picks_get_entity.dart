class HomeStickerPacksGetEntity {
  String _userId;

  HomeStickerPacksGetEntity({String userId}) {
    this._userId = userId;
  }

  String get userId => _userId;
  set userId(String userId) => _userId = userId;

  HomeStickerPacksGetEntity.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    return data;
  }
}
